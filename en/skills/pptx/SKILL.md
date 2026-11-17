---
name: pptx
description: "Use this skill any time a .pptx file is involved in any way — as input, output, or both. This includes: creating slide decks, pitch decks, or presentations; reading, parsing, or extracting text from any .pptx file (even if the extracted content will be used elsewhere, like in an email or summary); editing, modifying, or updating existing presentations; combining or splitting slide files; working with templates, layouts, speaker notes, or comments. Trigger whenever the user mentions \"deck,\" \"slides,\" \"presentation,\" or references a .pptx filename, regardless of what they plan to do with the content afterward. If a .pptx file needs to be opened, created, or touched, use this skill."
license: Proprietary. LICENSE.txt has complete terms
---

# PPTX Skill

## Quick Reference

| Task | Guide |
|------|-------|
| Read/analyze content | `python -m markitdown presentation.pptx` |
| Edit or create from template | Read [editing.md](editing.md) |
| Create from scratch | Read [pptxgenjs.md](pptxgenjs.md) |
| Exploratory セミナー用デザイン | Read [../exploratory-slides/SKILL.md](../exploratory-slides/SKILL.md) |

> **Exploratory セミナー用スライドを作成する場合:** 必ず `exploratory-slides` スキルのデザインガイドを参照し、カラーパレット・タイポグラフィ・レイアウト・Keynote互換性ルールに従うこと。

---

## Reading Content

```bash
# Text extraction
python -m markitdown presentation.pptx

# Visual overview
python scripts/thumbnail.py presentation.pptx

# Raw XML
python scripts/office/unpack.py presentation.pptx unpacked/
```

---

## Editing Workflow

**Read [editing.md](editing.md) for full details.**

1. Analyze template with `thumbnail.py`
2. Unpack → manipulate slides → edit content → clean → pack

---

## Creating from Scratch

**Read [pptxgenjs.md](pptxgenjs.md) for full details.**

Use when no template or reference presentation is available.

---

## Design Guide

> **重要:** このプロジェクトでは `exploratory-slides` スキルのデザインガイドに従うこと。
> 以下の汎用ガイドラインは **無視** し、必ず [exploratory-slides/SKILL.md](../exploratory-slides/SKILL.md) を読んでそちらに従うこと。

このプロジェクトは Exploratory セミナー用のため、独自のデザイン標準がある:
- **カラー:** 白背景 + 黒テキスト + グリーンアクセント(`#4CA872`)のみ。派手な色は使わない
- **フォント:** Hiragino Sans / Helvetica Neue のみ（Keynote互換）。Calibri、Georgia等は使用禁止
- **スタイル:** ミニマリスト。白背景に箇条書きのシンプルなスライドが基本スタイル
- **装飾:** 最小限。丸数字、カラフルなアイコン、グラデーション、色付きボックスは使わない

詳細は [exploratory-slides/SKILL.md](../exploratory-slides/SKILL.md) を参照。

---

## QA (Required)

**Assume there are problems. Your job is to find them.**

Your first render is almost never correct. Approach QA as a bug hunt, not a confirmation step. If you found zero issues on first inspection, you weren't looking hard enough.

### Content QA

```bash
python -m markitdown output.pptx
```

Check for missing content, typos, wrong order.

**When using templates, check for leftover placeholder text:**

```bash
python -m markitdown output.pptx | grep -iE "xxxx|lorem|ipsum|this.*(page|slide).*layout"
```

If grep returns results, fix them before declaring success.

### Visual QA

**⚠️ USE SUBAGENTS** — even for 2-3 slides. You've been staring at the code and will see what you expect, not what's there. Subagents have fresh eyes.

Convert slides to images (see [Converting to Images](#converting-to-images)), then use this prompt:

```
Visually inspect these slides. Assume there are issues — find them.

**Design rules for this presentation:**
[ここにデザインガイドの要約を記載 — 背景色、アクセントカラー、フォント、装飾ルール等]

Look for:
- Background color violations (design guide で指定された背景色と異なるスライドがないか)
- Overlapping elements (text through shapes, lines through words, stacked elements)
- Text overflow or cut off at edges/box boundaries
- Japanese text orphans (1-2文字だけが次の行に折り返されている箇所)
- Decorative lines positioned for single-line text but title wrapped to two lines
- Source citations or footers colliding with content above
- Elements too close (< 0.3" gaps) or cards/sections nearly touching
- Uneven gaps (large empty area in one place, cramped in another)
- Insufficient margin from slide edges (< 0.5")
- Columns or similar elements not aligned consistently
- Low-contrast text (e.g., light gray text on cream-colored background)
- Low-contrast icons (e.g., dark icons on dark backgrounds without a contrasting circle)
- Text boxes too narrow causing excessive wrapping
- Leftover placeholder content

**IMPORTANT:** Only inspect the slide images. Do NOT read or analyze code files.

For each slide, list issues or areas of concern, even if minor.

Read and analyze these images:
1. /path/to/slide-01.jpg (Expected: [brief description])
2. /path/to/slide-02.jpg (Expected: [brief description])

Report ALL issues found, including minor ones.
```

> **ヒント:** デザインガイド（例: `exploratory-slides/SKILL.md`）がある場合、サブエージェントのプロンプトにその要約（背景色、アクセントカラー、フォント制限等）を必ず含めること。ルールを知らないサブエージェントは違反を検出できない。

### Verification Loop

1. Generate slides → Convert to images → Inspect
2. **List issues found** (if none found, look again more critically)
3. Fix issues
4. **Re-verify affected slides** — one fix often creates another problem
5. Repeat until a full pass reveals no new issues

**Do not declare success until you've completed at least one fix-and-verify cycle.**

---

## Converting to Images

Convert presentations to individual slide images for visual inspection:

```bash
python scripts/office/soffice.py --headless --convert-to pdf output.pptx
pdftoppm -jpeg -r 150 output.pdf slide
```

This creates `slide-01.jpg`, `slide-02.jpg`, etc.

To re-render specific slides after fixes:

```bash
pdftoppm -jpeg -r 150 -f N -l N output.pdf slide-fixed
```

> **Note:** `pdftoppm` のファイル名は `{prefix}-{page}.jpg` の形式。`-f 9 -l 9` の場合、`slide-fixed-09.jpg` になる。

### Cleanup

QA完了後、一時ファイルを削除:

```bash
rm -f slide-*.jpg slide-fixed-*.jpg output.pdf
```

---

## Dependencies

- `pip install "markitdown[pptx]"` - text extraction
- `pip install Pillow` - thumbnail grids
- `npm install -g pptxgenjs` - creating from scratch
- LibreOffice (`soffice`) - PDF conversion (auto-configured for sandboxed environments via `scripts/office/soffice.py`)
- Poppler (`pdftoppm`) - PDF to images

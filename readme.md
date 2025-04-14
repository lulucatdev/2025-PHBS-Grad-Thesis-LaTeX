## 项目说明

本项目由[知经KNOWECON（knowecon.com）](https://knowecon.com) 基于 [2022 Peking University Master Thesis Template(iofu728-pkuthss)
](https://www.overleaf.com/latex/templates/2022-peking-university-master-thesis-template-iofu728-pkuthss/rwfvbkpzydpf)进行修改，以适配2025年北京大学汇丰商学院的硕士毕业论文要求。

本项目分为三个子LaTeX项目，分别是：

- `title_and_copy`：论文封面和版权声明页面
- `zh`：中文版论文、中文版摘要和致谢
- `en`：英文版论文、英文版摘要

你一般可以依次完成这些项目，然后将它们编译好的PDF文件按照封面、英文版论文、中文版论文的顺序合并。

本项目内容为一个虚构的“摸鱼”经济学论文，旨在为读者提供一个论文写作的一般格式参考，既包括理论论文相关格式，也包括实证论文相关格式。

## 使用步骤

1. 我使用 `xelatex` 来完成的这个项目。
2. 替换 `title_and_copy` 中的 `版权声明.pdf` 为门户下载的 `版权声明.pdf`。
3. 替换 `zh` 中的 `原创性声明.pdf` 为你的 `原创性声明.pdf`。
4. 替换 `configs.tex` 中的信息为你的论文信息，复制并覆盖 `title_and_copy`、`zh`、`en` 中的 `configs.tex`。你可以运行 `sh 001_generate_configs.sh` 来替换。
5. 此时，你应该可以编译出 `title_and_copy` 中的 `main.pdf`，即你的论文封面和版权声明页面。空白页的存在是合理的，因为我们需要把每章的第一页印在奇数页面。
6. 在 `zh/chap` 中完成中文版论文、中文版摘要和致谢。如要增加章节，可修改 `zh/main.tex`。
7. 在 `en/chap` 中完成英文版论文、英文版摘要。如要增加章节，可修改 `en/main.tex`。
8. 参考文献分别修改 `zh/ref.bib` 和 `en/ref.bib`，并用 `biber main` 命令更新。
9. 论文完成后，如果你已经安装了 `pdfunite` 命令行工具 （macOS 通过 `brew install poppler` 安装，windows 通过 `choco install poppler` 安装），可以运行 `sh 002_combine_pdfs.sh` 来合并封面、中文版和英文版论文。或者，你也可以通过 `smallpdf` 等在线工具对 `title_and_copy/main.pdf`、`en/main.pdf` 和 `zh/main.pdf` 进行合并即可。

## 注意事项

1. 你可以用 `\zhquote{...}` 来输入中文引号，用 `\enquote{...}` 来输入英文引号。
2. 别忘了在提交答辩版之前，要把导师名字隐去（包括封面、致谢等位置）。
3. 仔细阅读官方的论文说明和原模板使用说明，包括 `附件1`、`附件2` 和 `附件3`。
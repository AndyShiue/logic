pandoc -m -S -s --toc -f markdown+tex_math_dollars+latex_macros --template standalone.html --css template.css --self-contained -o logic.html logic.md

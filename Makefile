.PHONY: all clean

# 默认目标
all: run

# 编译LaTeX文档, 无信息输出
run: main.tex
	@xelatex -synctex=1 -interaction=nonstopmode -shell-escape -8bit -file-line-error main.tex > /dev/null
	@xelatex -synctex=1 -interaction=nonstopmode -shell-escape -8bit -file-line-error main.tex > /dev/null
	@xelatex -synctex=1 -interaction=nonstopmode -shell-escape -8bit -file-line-error main.tex > /dev/null
# 编译LaTeX文档, 有信息输出
debug: main.tex
	xelatex -synctex=1 -interaction=nonstopmode -shell-escape -8bit -file-line-error main.tex
	xelatex -synctex=1 -interaction=nonstopmode -shell-escape -8bit -file-line-error main.tex
	xelatex -synctex=1 -interaction=nonstopmode -shell-escape -8bit -file-line-error main.tex
# 清理生成的文件
clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.bcf *.run.xml *.ptc 
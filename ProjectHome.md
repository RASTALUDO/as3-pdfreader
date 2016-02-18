pdf reader for actionscript 3.0

The pdf lib is based on the Java PDFBOX lib (http://www.pdfbox.org)

# 开发计划 #

1. 解析pdf文件

2. 提出文本数据

3. 提出图片数据

最新进度：http://www.fluidea.cn/blog/index.php/category/as3-pdfreader

已经完成了纯文本的提取，现正在解决ASCII85编码问题。

常见的pdf文件中，文本使用Flate或ASCII85编码，对于ASCII语言(比如英文)，只要能解码，基本上就可以提取出文本。但对于中文等非ASCII码语言，则要复杂一些，希望在这方面有经验的同志可以联系我。


---


# Roadmap #
1. parse pdf file ( Done )

2. Extract text   (40%)

3. Extract image


# TODO #

add ASCII85 decoder and LZW decoder

### check svn to get the latest source. ###


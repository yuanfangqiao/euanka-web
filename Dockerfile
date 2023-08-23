FROM nginx:1.25.2
COPY dist/ /usr/share/nginx/html/
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# sed [-nefr] [动作]
# 选项与参数：
# -n ：使用安静(silent)模式。在一般 sed 的用法中，所有来自 STDIN 的数据一般都会被列出到终端上。但如果加上 -n 参数后，则只有经过sed 特殊处理的那一行(或者动作)才会被列出来。
# -e ：直接在命令列模式上进行 sed 的动作编辑；
# -f ：直接将 sed 的动作写在一个文件内， -f filename 则可以运行 filename 内的 sed 动作；
# -r ：sed 的动作支持的是延伸型正规表示法的语法。(默认是基础正规表示法语法)
# -i ：直接修改读取的文件内容，而不是输出到终端。
# sed -i 's/原字符串/新字符串/' /home/1.txt
# sed -i 's/原字符串/新字符串/g' /home/1.tx


CMD ["/bin/bash", "-c", "sed -i \"s@<html@<html data-promise-base-url=\"$VUE_APP_API_BASE_URL\"@\" /usr/share/nginx/html/index.html; nginx -g \"daemon off;\""]

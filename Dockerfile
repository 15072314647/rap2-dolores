# 拉取10.1.0版本的node镜像
FROM node:10.1.0

# 维护人
MAINTAINER liwangmijia <i@liwangmj.com>

# 创建工作目录
RUN mkdir -p /home/rap2-dolores
WORKDIR /home/rap2-dolores

# 将代码拷贝至工作目录
COPY . /home/rap2-dolores

# 安装nginx
RUN apt-get update && apt-get install -y nginx

# 全局安装node-sass(一定要带--unsafe-perm，否则会报错)
RUN npm install --unsafe-perm -g node-sass

# 安装依赖
RUN npm install

# 打包
RUN npm run build

EXPOSE 80 443

CMD ["nginx","-g","daemon off;"]

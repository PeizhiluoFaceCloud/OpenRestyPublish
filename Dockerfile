#Dockerfile
#FROM openresty_face/base:v0.01
FROM daocloud.io/peizhiluo007/openresty:latest
MAINTAINER peizhiluo007<25159673@qq.com>

#采用supervisor来管理多任务
#配置文件的路径变化了(since Supervisor 3.3.0)
COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY publish_lua/ /xm_workspace/xmcloud3.0/publish_lua/
RUN	chmod 777 /xm_workspace/xmcloud3.0/publish_lua/*

EXPOSE 8003
WORKDIR /xm_workspace/xmcloud3.0/publish_lua/
CMD ["supervisord"]


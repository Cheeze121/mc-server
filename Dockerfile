FROM itzg/minecraft-server

# 집 PC에서 미리 만든 서버 파일(paper.jar, cache/, libraries/ 등)을 이미지에 넣어 둔다.
COPY seed/ /seed/

# /data가 비어 있을 때만 seed를 복사하고, 이후에는 원래 시작 스크립트를 실행한다.
ENTRYPOINT ["/bin/sh", "-c", "[ -f /data/paper.jar ] || cp -a /seed/. /data/; exec /image/scripts/start"]

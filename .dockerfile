FROM Ubuntu

COPY update_gmod.sh ./gmod

RUN chmod +x ./gmod/update_gmod.sh \
    && apt install dos2unix -y \
    && dos2unix ./gmod/update_gmod.sh

ENTRYPOINT ./gmod/update_gmod.sh

EXPOSE 27015
FROM rocker/verse:4.1.0

COPY scripts/install_nmosd.sh /tmp/
RUN echo "Install R Package Dependencies" \
  && chmod +x /tmp/install_nmosd.sh \
  && /tmp/install_nmosd.sh \
  && rm /tmp/install_nmosd.sh



FROM rocker/verse:4.1.0

COPY scripts/install_nmosd.sh /tmp/

RUN echo "Install R Package Dependencies" \
  && chmod +x /tmp/install_nmosd.sh \
  && /tmp/install_nmosd.sh \
  && rm /tmp/install_nmosd.sh

RUN echo "Texlive dependencies for default knitr to render pdf" \
  && tlmgr install \
    amsmath \
    latex-amsmath-dev \
    iftex \
    kvoptions \
    ltxcmds \
    kvsetkeys \
    etoolbox \
    auxhook \
    bigintcalc \
    bitset \
    etexcmds \
    gettitlestring \
    hycolor \
    hyperref \
    intcalc \
    kvdefinekeys \
    letltxmacro \
    pdfescape \
    refcount \
    rerunfilecheck \
    stringenc \
    uniquecounter \
    zapfding \
    pdftexcmds \
    infwarerr \
    geometry \
    fancyvrb \
    framed \
    epstopdf-pkg \
    xcolor

RUN echo "Texlive dependencies for template eisvogel (pdf)" \
  && tlmgr install \
    koma-script \
    setspace \
    colortbl \
    fvextra \
    upquote \
    lineno \
    footnotebackref \
    grffile \
    float \
    babel-english \
    csquotes \
    caption \
    mdframed \
    zref \
    needspace \
    sourcesanspro \
    ly1 \
    sourcecodepro \
    titling \
    fancyhdr \
    bookmark \
    booktabs \
    mdwtools \
    unicode-math \
    polyglossia \
    pgf \
    background \
    pagecolor


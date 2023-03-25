# Tex image
FROM texlive/texlive

# Creates workin dir for LaTeX files
WORKDIR /tex

# Copy files from tex folder in the current repo to WORKDIR in the container 
COPY ./tex ./

# When container runs, compile main .tex with pdflatex
CMD pdflatex SimpleCV.tex

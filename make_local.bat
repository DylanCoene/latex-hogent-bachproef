@echo off
SETLOCAL

REM Directory where the main .tex file is located
cd /d "%~dp0bachproef"

REM Define variables
SET MAIN_FILE=CoeneDylanBP
SET TEXMF_OUTPUT_DIRECTORY=.

echo ==========================================
echo Starting LaTeX Compilation (Local)
echo ==========================================

REM 1. First XeLaTeX run with shell-escape for Minted
echo Running XeLaTeX (Step 1/4)...
xelatex -shell-escape -interaction=nonstopmode %MAIN_FILE%.tex

REM 2. Run Biber for Bibliography
echo Running Biber (Step 2/4)...
biber %MAIN_FILE%

REM 3. Second XeLaTeX run for Citations
echo Running XeLaTeX (Step 3/4)...
xelatex -shell-escape -interaction=nonstopmode %MAIN_FILE%.tex

REM 4. Third XeLaTeX run for Cross-references and TOC
echo Running XeLaTeX (Step 4/4)...
xelatex -shell-escape -interaction=nonstopmode %MAIN_FILE%.tex

echo ==========================================
echo Compilation Finished
echo ==========================================
pause

.PHONY: examples

CC = xelatex
BUILD_DIR = build
RESUME_DIR = resume/

RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')

all: coverletter resume cv

makedirs:
	mkdir -p $(BUILD_DIR)

resume: resume.tex $(RESUME_SRCS) makedirs
	$(CC) -output-directory=$(BUILD_DIR) $<
	convert -density 300 $(BUILD_DIR)/resume.pdf -resize 50% -alpha remove $(BUILD_DIR)/resume.png

cv: cv.tex $(RESUME_SRCS) makedirs
	$(CC) -output-directory=$(BUILD_DIR) $<
	convert -density 300 $(BUILD_DIR)/cv.pdf -resize 50% -alpha remove $(BUILD_DIR)/cv.png

coverletter: coverletter.tex makedirs
	$(CC) -output-directory=$(BUILD_DIR) $<
	convert -density 300 $(BUILD_DIR)/coverletter.pdf -resize 50% -alpha remove $(BUILD_DIR)/coverletter.png

clean:
	rm -rf $(BUILD_DIR)/*

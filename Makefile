SHELL :=/bin/bash

.PHONY: clean check setup
.DEFAULT_GOAL=help
VENV_DIR = .venv
IMAGE_NAME := func-calling-demo
LOCAL_PORT := 8501

check: # Ruff check
	@ruff check .
	@echo "✅ Check complete!"

fix: # Fix auto-fixable linting issues
	@ruff check app.py --fix

clean: # Clean temporary files
	@rm -rf __pycache__ .pytest_cache
	@find . -name '*.pyc' -exec rm -r {} +
	@find . -name '__pycache__' -exec rm -r {} +
	@rm -rf build dist
	@find . -name '*.egg-info' -type d -exec rm -r {} +

run: # Run the application
	@streamlit run app.py

build-image:
	@if docker image inspect $(IMAGE_NAME) > /dev/null 2>&1; then \
		echo "✅ Image $(IMAGE_NAME) exists"; \
	else \
		echo "❌ Image $(IMAGE_NAME) does not exist"; \
		echo "🔨 Bulding image..."; \
		docker build -t $(IMAGE_NAME) .; \
	fi

run-docker: build-image # Run the application in a Docker container
	@docker run --name $(IMAGE_NAME) -p $(LOCAL_PORT):8501 -d $(IMAGE_NAME)
	@echo "🎉 Goto http://localhost:$(LOCAL_PORT) to get started!"

setup: # Initial project setup
	@echo "Creating virtual env at: $(VENV_DIR)"s
	@python3 -m venv $(VENV_DIR)
	@echo "Installing dependencies..."
	@source $(VENV_DIR)/bin/activate && pip install -r requirements/requirements-dev.txt && pip install -r requirements/requirements.txt
	@echo -e "\n✅ Done.\n🎉 Run the following commands to get started:\n\n ➡️ source $(VENV_DIR)/bin/activate\n ➡️ make run\n"


help: # Show this help
	@egrep -h '\s#\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?# "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

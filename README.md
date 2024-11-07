# 𝑓 Function Calling Demo Application

Demo function calling app for the YouTube video.

Watch the video 👇

<a href="https://www.youtube.com/watch?v=1Wen70lzX-8">
<img src="https://i.imgur.com/RK2ckBX.png" width="800">
</a>

## 🔨 Setting up locally

Create virtualenv and install dependencies.

This step is not required if you are running in docker.

```sh
make setup
```

## ⚡️ Running the application

Make sure you have [Ollama](https://ollama.com/download) installed and running on your machine.

By default, the app uses [mistral-nemo](https://ollama.com/library/mistral-nemo) model but you can use [Llama3.1](https://ollama.com/library/llama3.1) or [Llama3.2](https://ollama.com/library/llama3.2).

Download these models before running the application. Update [app.py](https://github.com/yankeexe/llm-function-calling-demo/blob/55b73c6947f05d460f284d92136285b4e1d233bd/app.py#L66) to change the model if necessary.

### Running locally

```sh
make run
```

### Running in a container

```sh
make run-docker
```
<details>
<summary>⚠️ Does not work with Linux 🐧</summary>

Application running inside of the container uses a special DNS name `host.docker.internal` to communicate with Ollama running on the host machine.

However, this DNS name is not resolvable in Linux.
</details>

## ✨ Linters and Formatters

Check for linting rule violations:

```sh
make check
```

Auto-fix linting violations:

```sh
make fix
```

## 🤸‍♀️ Getting Help

```sh
make

# OR

make help
```

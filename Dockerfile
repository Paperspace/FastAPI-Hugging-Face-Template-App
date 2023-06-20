FROM paperspace/fastapi-app-base:2023-06-14

WORKDIR /app

COPY app ./app
COPY requirements.txt ./

RUN pip3 install -U pip && pip3 install -r requirements.txt

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
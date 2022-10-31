FROM python:3

WORKDIR /app

COPY . .

RUN pip3 install \
    hiredis \
    aioredis \
    asyncio \
    aiogram

CMD [ "python3", "bot.py" ]

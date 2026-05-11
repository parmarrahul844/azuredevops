import psycopg2
import os
import json
import logging


def write_event(source, payload):

    logging.info("Connecting to PostgreSQL")

    conn = psycopg2.connect(
        host=os.getenv("PG_HOST"),
        database=os.getenv("PG_DB"),
        user=os.getenv("PG_USER"),
        password=os.getenv("PG_PASSWORD"),
        port=5432
    )

    logging.info(f"DB config -> host={os.getenv('PG_HOST')} db={os.getenv('PG_DB')} user={os.getenv('PG_USER')}")

    cur = conn.cursor()

    logging.info("Inserting event into database")

    cur.execute(
        "INSERT INTO events(source, payload) VALUES (%s,%s)",
        (source, json.dumps(payload))
    )

    conn.commit()

    logging.info("Insert successful")

    cur.close()
    conn.close()
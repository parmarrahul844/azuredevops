# import azure.functions as func
# import json
# import base64
# import logging
# from db_handler import write_event

# app = func.FunctionApp()


# @app.queue_trigger(
#     arg_name="msg",
#     queue_name="event-queue",
#     connection="AzureWebJobsStorage"
# )
# def queue_processor(msg: func.QueueMessage):

#     logging.info("Queue trigger fired")

#     try:
#         # Raw body from queue
#         raw_body = msg.get_body()
#         logging.info(f"Raw message bytes: {raw_body}")

#         # Convert bytes -> string
#         body_str = raw_body.decode("utf-8")
#         logging.info(f"Decoded string: {body_str}")

#         # Try parsing JSON directly
#         try:
#             data = json.loads(body_str)
#         except json.JSONDecodeError:
#             # If message itself is Base64 encoded
#             logging.info("Attempting Base64 decode...")
#             decoded = base64.b64decode(body_str).decode("utf-8")
#             logging.info(f"Base64 decoded message: {decoded}")
#             data = json.loads(decoded)

#         logging.info(f"Parsed JSON payload: {data}")

#         # Write event to Postgres
#         write_event("queue_event", data)

#         logging.info("Event written to database successfully")

#     except Exception as e:
#         logging.error(f"Function execution failed: {str(e)}")
#         raise

import azure.functions as func
import logging
import json
import traceback

from db_handler import write_event

app = func.FunctionApp()

@app.queue_trigger(
    arg_name="msg",
    queue_name="event-queue",
    connection="AzureWebJobsStorage"
)
def queue_processor(msg: func.QueueMessage):

    logging.info("========== QUEUE FUNCTION STARTED ==========")

    try:
        raw = msg.get_body()
        logging.info(f"Raw bytes: {raw}")

        body = raw.decode("utf-8")
        logging.info(f"Decoded body: {body}")

        payload = json.loads(body)
        logging.info(f"JSON payload: {payload}")

        logging.info("Writing event to database...")
        write_event("queue_event", payload)

        logging.info("SUCCESS: event written to database")

    except Exception as e:
        logging.error("FUNCTION ERROR OCCURRED")
        logging.error(str(e))
        logging.error(traceback.format_exc())
        raise
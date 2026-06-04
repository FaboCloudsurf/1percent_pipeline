from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello from Dockerized Flask App!'

if __name__ == '__main__':
    # Host '0.0.0.0' allows the app to accept connections from outside its container
    app.run(host='0.0.0.0', port=5001)


#webhook test 3
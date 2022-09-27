import json

from flask import Flask, render_template,request
from flask_mysqldb import MySQL

app = Flask("MovieApp")

app.config["MYSQL_HOST"] = "127.0.0.1"
app.config["MYSQL_USER"] = "root"
app.config["MYSQL_PASSWORD"] = ...
app.config["MYSQL_DB"] = "movie_db"
mysql =MySQL(app)

@app.route("/")
def hello_world():
    return "<p> Hello!</p>"

@app.route("/movies/")
def list_movies():
    cursor = mysql.connection.cursor()
    query_string = "SELECT * from movies_tbl;"
    cursor.execute(query_string)
    data = cursor.fetchall()
    cursor.close()
    return json.dumps(data)


@app.route("/movies-table/")
def list_movie_table():
    cursor = mysql.connection.cursor()
    query_string = "SELECT * from movies_tbl;"
    cursor.execute(query_string)
    data = cursor.fetchall()
    cursor.close()
    return render_template("movies.html",movies_data = data)

@app.route("/add-director/",methods = ['GET','POST'])
def add_director():
    if request.method == 'GET':
        return render_template("addDirectories.html")
    if request.method == 'POST':
        id = int(request.form["id"])
        name = request.form["name"]
        birth_year = int(request.form["birth_year"])
        conn = connection()
        cursor = conn.cursor()
        cursor.execute("INSERT INTO directors_tbl (id, name, birth_year) VALUES (%s, %s, %s)", (id, name, birth_year))


if __name__== "__main__":
    app.run(host="127.0.0.1")
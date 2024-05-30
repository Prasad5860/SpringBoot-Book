<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Book</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h2>Edit Book</h2>
    <form action="updateBook" method="post" class="form-horizontal">
        <div class="form-group">
            <label for="id" class="col-sm-2 control-label">ID:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="id" name="id" value="${book.id}" readonly>
            </div>
        </div>
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">Name:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="name" name="name" value="${book.name}">
            </div>
        </div>
        <div class="form-group">
            <label for="publisher" class="col-sm-2 control-label">Publisher:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="publisher" name="publisher" value="${book.publisher}">
            </div>
        </div>
        <div class="form-group">
            <label for="type" class="col-sm-2 control-label">Type:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="type" name="type" value="${book.type}">
            </div>
        </div>
        <div class="form-group">
            <label for="date" class="col-sm-2 control-label">Date:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="date" name="date" value="${book.date}">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">Update</button>
            </div>
        </div>
    </form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Books Information</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Books Information</h2>
  <table class="table">
    <thead>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Publisher</th>
        <th>Type</th>
        <th>Date</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody id="bookTableBody">
    </tbody>
  </table>
  <button id="add" class="btn btn-primary">Add Book</button>
</div>

<script>
$(document).ready(function(){
    $.ajax({
        type:'GET',
        url:'getbook',
        contentType: 'application/json',
        success: function(data){
            $.each(data,function(ind,newBook){
                const newRow = '<tr><td>'+ newBook.id+'</td><td>'+ newBook.name+'</td><td>'+newBook.publisher+'</td><td>' + newBook.type + '</td><td>' + newBook.date+'</td>' +
                    '<td><button class="btn btn-primary btn-sm edit" data-id="' + newBook.id + '">Edit</button>&nbsp;' +
                    '<button class="btn btn-danger btn-sm delete" data-id="' + newBook.id + '">Delete</button></td></tr>';
                $('#bookTableBody').append(newRow);
            })
        },
        error: function(xhr, status, error) {
                console.log("error")
                $("#error-message").text(xhr.responseText);
            }
    })
    
    $(document).on('click', '.edit', function() {
        var row = $(this).closest('tr')
        var id = row.find('td:first').text();
        window.location.href='edit/'+id;
        
    });
    
    $(document).on('click', '.delete', function() {
        var row = $(this).closest('tr')
        var id = row.find('td:first').text();
        window.location.href='delete/'+id;
    });
    
    $('#add').click(function(){
    	window.location.href="add";
    })
})
</script>

</body>
</html>

</html>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link rel="stylesheet" href="/static/css/style.css" />
    <title>Todo grpc</title>
  </head>
  <body>
    <div class="container">
        <div class="d-flex flex-column justify-content-center">
            <h2 class="mt-4 mb-5 w-50 ml-auto mr-auto" style="text-align: center;">GRPC TODO LIST </h2>
            <div class="list-group w-50 ml-auto mr-auto">
                {{ range $index, $element := .ToDos}}
                <a href="#" class="list-group-item list-group-item-action flex-column align-items-start {{if mod $index 2}}active{{end}}">
                    <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1">{{$element.Title}}</h5>
                        <div>
                            <small {{if not (mod $index 2)}}class="text-muted"{{end}}>{{$element.InsertAt | timeElapsedTimestamp}} ago</small>
                            <i class="fa fa-pencil-square-o icon" aria-hidden="true" onclick="redirect('/todo/{{$element.Id}}')"></i>
                            <i class="fa fa-trash icon" aria-hidden="true" onclick="deleteTodo('{{$element.Id}}')"></i>
                        </div>
                        
                    </div>
                    <p class="mb-1">{{$element.Description}}</p>
                    
                </a>
                {{end}}
            </div>

            <div class="mt-5 w-50 ml-auto mr-auto">
                <form action="/todo" method="POST">
                    <div class="form-group">
                        <label>Title</label>
                        <input name="title" class="form-control" placeholder="Enter title">
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <textarea name="description" class="form-control" rows="3"></textarea>
                    </div>
                    <div class="d-flex justify-content-end">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>  
                </form>
            </div>
            
        </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="/static/js/script.js"></script>
  </body>
</html>
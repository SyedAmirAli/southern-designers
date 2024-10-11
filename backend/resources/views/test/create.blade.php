<form action="{{ route('test.new-helper.store')}}" method="POST" enctype="multipart/form-data"> @csrf
    <div>
        <label for="">Name:</label>
        <input type="text" placeholder="Username" name="username">
    </div>
    <div>
        <label for="">E-mail:</label>
        <input type="text" placeholder="example@gmail.com" name="email">
    </div>
    <div>
        <label for="">Password:</label>
        <input type="password" placeholder="*********" name="password">
    </div>
    <div>
        <label for="">Picture:</label>
        <input type="file" placeholder="*********" name="picture">
    </div>

    <div>
        <button type="submit">SUBMIT</button>
    </div>
</form>


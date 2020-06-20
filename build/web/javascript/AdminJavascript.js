/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function openhomepage(){
    window.location.href="Admin.jsp";
}
function openalbumpage(){
    $("#centerpage").load("album.jsp");
}
function openartistspage(){
    $("#centerpage").load("artists.jsp");
}
function opengenrespage(){
    $("#centerpage").load("genres.jsp");
}
function opentrackpage(){
    $("#centerpage").load("track.jsp");
}
function openplaylistpage(){
    $("#centerpage").load("playlist.jsp");
}
function openadvertiespage(){
    $("#centerpage").load("advertise.jsp");
}
//change center page menu
function OpenSong(album_id){
    $("#centerpage").load("OpenSong.jsp",{id:''+album_id+''});
}
function OpenMenu(){
    $("#centerpage").load("AllAlbums.jsp");
}
function centerpage(){
    $("#centerpage").load("CenterMenupage.jsp");
}
function Logout(){
    window.location.href="AdminLogin.html";
}

function addalbumvalidate(){
    var albumname=document.getElementById("albumname").value;
    var releasedate=document.getElementById("releasedate").value;
    var file=document.getElementById("imagefile").value;
    if (albumname===""){
        alert("Enter Album Name");
        return false;
    }
    if(releasedate===""){
        alert("Enter ReleaseDate");
        return false;
    }
    if(file===""){
        alert("Select ImageFile for Album");
        return false;
    }else{
        var allowed_extensions = new Array("jpg","png","gif");
        var file_extension = file.split('.').pop().toLowerCase(); // split function will split the filename by dot(.), and pop function will pop the last element from the array which will give you the extension as well. If there will be no extension then it will return the filename.

        for(var i = 0; i <= allowed_extensions.length; i++)
        {
            if(allowed_extensions[i]==file_extension)
            {
                return true; // valid file extension
            }
        }
        alert("Selected File is invalid");
        return false;
    }
}
function addartistsvalidation(){
    var artistsname=document.getElementById("artistsname").value;
    var imagefile=document.getElementById("imagefile").value;
    if(artistsname===""){
        alert("Enter Artists Name");
        return false;
    }
    if(imagefile===""){
        alert("Select ImageFile for Album");
        return false;
    }else{
        var allowed_extensions = new Array("jpg","png","gif");
        var file_extension = imagefile.split('.').pop().toLowerCase(); // split function will split the filename by dot(.), and pop function will pop the last element from the array which will give you the extension as well. If there will be no extension then it will return the filename.

        for(var i = 0; i <= allowed_extensions.length; i++)
        {
            if(allowed_extensions[i]==file_extension)
            {
                return true; // valid file extension
            }
        }
        alert("Selected File is invalid");
        return false;
    }
}
function addgenresvalidation(){
    var genresname=document.getElementById("genresname").value;
    if(genresname===""){
        alert("Enter Genres Name");
        return false;
    }
}
function addtrackvalidation(){
    var trackname=document.getElementById("trackname").value;
    var audiofile=document.getElementById("audiofile").value;
    var trackplaytime=document.getElementById("trackname").value;
    var selectalbum=document.getElementById("selectalbum").value;
    var selectartists=document.getElementById("selectartists").value;
    
    if(trackname===""){
        alert("Enter Track Name");
        return false;
    }
    if(audiofile===""){
        alert("Select TrackFile");
        return false;
    }else{
        var choosefile=false;
        var allowed_extensions = new Array("mp3");
        var file_extension = audiofile.split('.').pop().toLowerCase(); // split function will split the filename by dot(.), and pop function will pop the last element from the array which will give you the extension as well. If there will be no extension then it will return the filename.
        
        for(var i = 0; i <= allowed_extensions.length; i++)
        {
            if(allowed_extensions[i]==file_extension)
            {
                choosefile=true; // valid file extension
            }
        }
        if(choosefile==false){
            alert("Selected File is invalid");
            return false;
        }
    }
    if(trackplaytime===""){
        alert("Enter Trackplaytime");
        return false;
    }
    if(selectalbum===""){
        alert("Select Album");
        return false;
    }
    if(selectartists===""){
        alert("Select Artists");
        return false;
    }
}
function addadvvalidation(){
    var imagefile=document.getElementById("imagefile").value;
    var albumselector=document.getElementById("albumselector").value;
    
    if(imagefile===""){
        alert("Select TrackFile");
        return false;
    }else{
        var choosefile=false;
        var allowed_extensions = new Array("jpg","png","gif");
        var file_extension = imagefile.split('.').pop().toLowerCase(); // split function will split the filename by dot(.), and pop function will pop the last element from the array which will give you the extension as well. If there will be no extension then it will return the filename.
        
        for(var i = 0; i <= allowed_extensions.length; i++)
        {
            if(allowed_extensions[i]==file_extension)
            {
                choosefile=true; // valid file extension
            }
        }
        if(choosefile==false){
            alert("Selected File is invalid");
            return false;
        }
    }
    if(albumselector===""){
        alert("Select Album");
        return false;
    }
}
/* 
/* 
/* 
/* 
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* global r */

window.onload=function(){$("#centerpage").load("CenterMenupage.jsp");};
var previousSong;
var previousId;
var currentSong;
var audioidvalue;
var iframe,audiotag,trackname,innerDoc,audio,curtimetext,durtimetext,seeking,seekslider,seekto,btnnext,btnprevious,playbutton;
var isPlaying = false;

//iframe = document.getElementById("musiciframe");
//innerDoc = iframe.contentDocument || iframe.contentWindow.document;

//audiotag=innerDoc.getElementsByTagName("audio");

//curtimetext = innerDoc.getElementById("curtimetext");
curtimetext = document.getElementById("curtimetext");
//durtimetext = innerDoc.getElementById("durtimetext");
durtimetext = document.getElementById("durtimetext");
//playbutton = innerDoc.getElementById("playbutton");
playbutton=document.getElementById("playbutton");
//btnnext = innerDoc.getElementById("btnnext");
btnnext=document.getElementById("btnnext");
//btnprevious = innerDoc.getElementById("btnprevious");
btnprevious=document.getElementById("btnprevious");
//seekslider = innerDoc.getElementById("fillBar");
seekslider=document.getElementById("fillBar");

function playsongs(src,name){
    var playlist_index=null;
    var destination = document.getElementById('tableB');
    
    if(src!=null){
        destination.innerHTML="";
    }
    for(r=0;r<name.length;r++){
        destination.innerHTML +="<table>\n\
                                    <tr>\n\
                                        <td style='border-bottom: 1px solid #ccc;height: 50px;width: 100%;'>\n\
                                            "+name[r]+"\
                                        <td>\n\
                                    </tr>\n\
                                </table>";
    }
    
    if(audio!=null){
        audio.pause();
        audio.src=null;
        playlist_index = 0;
    
    seeking=false;
    
    audio = new Audio();
    audio.onplaying = function() {
        isPlaying = true;
    };
    audio.onpause = function() {
        isPlaying = false;
    };
    
    audio.setAttribute("src",src[0]);
    
    audio.loop = false;
    audio.currentTime=0;
    if(currentSong==null){
        audio.play();
        $("#playbutton i").attr("class","far fa-pause-circle");
        //$("#musiciframe").contents().find("#playbutton i").attr("class","far fa-pause-circle");
    }else{
        if(currentSong.play){
        currentSong.pause();
        currentSong=null;
        //playorpausesong=function(){return false;};
        audio.play();
        $("#playbutton i").attr("class","far fa-pause-circle");
        //$("#musiciframe").contents().find("#playbutton i").attr("class","far fa-pause-circle");
        }else{
            audio.play();
            $("#playbutton i").attr("class","far fa-pause-circle");
            //$("#musiciframe").contents().find("#playbutton i").attr("class","far fa-pause-circle");
        }
    }
    
    document.getElementById("trackname").innerHTML=name[0];
    
    seekslider.addEventListener("mousedown", function(event){ seeking=true; seek(event); });
    seekslider.addEventListener("mousemove", function(event){ seekk(event); });
    seekslider.addEventListener("mouseup",function(){ seeking=false; });
    audio.addEventListener("timeupdate", function(){ seektimeupdatee(); });
    audio.addEventListener("ended", function(){ switchTrackk(); });
    playbutton.addEventListener("click", function(){ songpausee(); });
    btnnext.addEventListener("click", function(){ nextsongg(); });
    btnprevious.addEventListener("click", function(){ previoussongg(); });
    
    function songpausee(){
        if (isPlaying) {
            audio.pause();
            $("#playbutton i").attr("class","far fa-play-circle");
            //$("#musiciframe").contents().find("#playbutton i").attr("class","far fa-play-circle");
        } else {
            audio.play();
            $("#playbutton i").attr("class","far fa-pause-circle");
            //$("#musiciframe").contents().find("#playbutton i").attr("class","far fa-pause-circle");
        }
    }
    function nextsongg(){
        console.log("first_"+playlist_index);
        if(playlist_index === src.length - 1){
            playlist_index = 0;
	} else {
            playlist_index++;
            console.log("secound_"+playlist_index);
	}
        //playlist_status.innerHTML = "Track "+(currentSong+1)+" - "+ playlist[currentSong]+ext;
        //innerDoc.getElementById("trackname").innerHTML=name[playlist_index];
        document.getElementById("trackname").innerHTML=name[playlist_index];
        //audio.src=src[playlist_index];
        audio.setAttribute("src",src[playlist_index]);
        audio.play();
    }
    function directjumpsong(dd){
        playlist_index=dd;
        audio.setAttribute("src",src[playlist_index]);
        audio.play();
    }
    function previoussongg(){
        console.log(src.length);
        if(playlist_index === 0){
            playlist_index=src.length - 1;
        }else{
            playlist_index--;
        }
        //innerDoc.getElementById("trackname").innerHTML=name[playlist_index];
        document.getElementById("trackname").innerHTML=name[playlist_index];
        audio.src=src[playlist_index];
        audio.play();
    }
    function switchTrackk(){
	if(playlist_index === (src.length - 1)){
            playlist_index = 0;
	} else {
            playlist_index++;
	}
        //playlist_status.innerHTML = "Track "+(currentSong+1)+" - "+ playlist[currentSong]+ext;
        //innerDoc.getElementById("trackname").innerHTML=name[playlist_index];
        document.getElementById("trackname").innerHTML=name[playlist_index];
        audio.src=src[playlist_index];
        audio.play();
    }
    function seekk(event){
	if(seeking){
            var percent = event.offsetX / seekslider.offsetWidth;
            audio.currentTime = percent * audio.duration;
            seekslider.value = percent / 100;
	}
    }
    function seektimeupdatee(){
        var nt = audio.currentTime * (100 / audio.duration);
        seekslider.value = nt;
        var curmins = Math.floor(audio.currentTime / 60);
        var cursecs = Math.floor(audio.currentTime - curmins * 60);
        var durmins = Math.floor(audio.duration / 60);
        var dursecs = Math.floor(audio.duration - durmins * 60);
        if(cursecs < 10){ cursecs = "0"+cursecs; }
        if(dursecs < 10){ dursecs = "0"+dursecs; }
        if(curmins < 10){ curmins = "0"+curmins; }
        if(durmins < 10){ durmins = "0"+durmins; }
        curtimetext.innerHTML = curmins+":"+cursecs;
        durtimetext.innerHTML = durmins+":"+dursecs;
    }
    }else{
    playlist_index = 0;
    
    seeking=false;
    
    audio = new Audio();
    audio.onplaying = function() {
        isPlaying = true;
    };
    audio.onpause = function() {
        isPlaying = false;
    };
    
    audio.src = src[0];
    
    audio.loop = false;
    audio.currentTime=0;
    if(currentSong==null){
        audio.play();
        $("#playbutton i").attr("class","far fa-pause-circle");
        //$("#musiciframe").contents().find("#playbutton i").attr("class","far fa-pause-circle");
    }else{
        if(currentSong.play){
        currentSong.pause();
        currentSong=null;
        //playorpausesong=function(){return false;};
        audio.play();
        $("#playbutton i").attr("class","far fa-pause-circle");
        //$("#musiciframe").contents().find("#playbutton i").attr("class","far fa-pause-circle");
        }else{
            audio.play();
            $("#playbutton i").attr("class","far fa-pause-circle");
            //$("#musiciframe").contents().find("#playbutton i").attr("class","far fa-pause-circle");
        }
    }
    
    document.getElementById("trackname").innerHTML=name[0];
    
    seekslider.addEventListener("mousedown", function(event){ seeking=true; seek(event); });
    seekslider.addEventListener("mousemove", function(event){ seek(event); });
    seekslider.addEventListener("mouseup",function(){ seeking=false; });
    audio.addEventListener("timeupdate", function(){ seektimeupdate(); });
    audio.addEventListener("ended", function(){ switchTrack(); });
    playbutton.addEventListener("click", function(){ songpause(); });
    btnnext.addEventListener("click", function(){ nextsong(); });
    btnprevious.addEventListener("click", function(){ previoussong(); });
    
    function songpause(){
        if (isPlaying) {
            audio.pause();
            $("#playbutton i").attr("class","far fa-play-circle");
            //$("#musiciframe").contents().find("#playbutton i").attr("class","far fa-play-circle");
        } else {
            audio.play();
            $("#playbutton i").attr("class","far fa-pause-circle");
            //$("#musiciframe").contents().find("#playbutton i").attr("class","far fa-pause-circle");
        }
    }
    function nextsong(){
        console.log("first_"+playlist_index);
        if(playlist_index === src.length - 1){
            playlist_index = 0;
	} else {
            playlist_index++;
            console.log("secound_"+playlist_index);
	}
        //playlist_status.innerHTML = "Track "+(currentSong+1)+" - "+ playlist[currentSong]+ext;
        //innerDoc.getElementById("trackname").innerHTML=name[playlist_index];
        document.getElementById("trackname").innerHTML=name[playlist_index];
        audio.src=src[playlist_index];
        audio.play();
    }
    function previoussong(){
        console.log(src.length);
        if(playlist_index === 0){
            playlist_index=src.length - 1;
        }else{
            playlist_index--;
        }
        //innerDoc.getElementById("trackname").innerHTML=name[playlist_index];
        document.getElementById("trackname").innerHTML=name[playlist_index];
        audio.src=src[playlist_index];
        audio.play();
    }
    function switchTrack(){
	if(playlist_index === (src.length - 1)){
            playlist_index = 0;
	} else {
            playlist_index++;
	}
        //playlist_status.innerHTML = "Track "+(currentSong+1)+" - "+ playlist[currentSong]+ext;
        //innerDoc.getElementById("trackname").innerHTML=name[playlist_index];
        document.getElementById("trackname").innerHTML=name[playlist_index];
        audio.src=src[playlist_index];
        audio.play();
    }
    function seek(event){
	if(seeking){
            var percent = event.offsetX / seekslider.offsetWidth;
            audio.currentTime = percent * audio.duration;
            seekslider.value = percent / 100;
	}
    }
    function seektimeupdate(){
        var nt = audio.currentTime * (100 / audio.duration);
        seekslider.value = nt;
        var curmins = Math.floor(audio.currentTime / 60);
        var cursecs = Math.floor(audio.currentTime - curmins * 60);
        var durmins = Math.floor(audio.duration / 60);
        var dursecs = Math.floor(audio.duration - durmins * 60);
        if(cursecs < 10){ cursecs = "0"+cursecs; }
        if(dursecs < 10){ dursecs = "0"+dursecs; }
        if(curmins < 10){ curmins = "0"+curmins; }
        if(durmins < 10){ durmins = "0"+durmins; }
        curtimetext.innerHTML = curmins+":"+cursecs;
        durtimetext.innerHTML = durmins+":"+dursecs;
    }
}
}

function add3Dots(string, limit)
{
  var dots = "...";
  if(string.length > limit)
  {
    // you can also use substr instead of substring
    string = string.substring(0,limit) + dots;
  }
    document.getElementById('df').innerHTML=String;
    //innerDoc.getElementById("df").innerHTML=String;
}

//change center page menu
function OpenMenu(){
    $("#centerpage").load("AllAlbums.jsp");
}
function OpenSong(album_id){
    $("#centerpage").load("OpenSong.jsp",{id:''+album_id+''});
}
function OpenSongArtists(artists_id){
    $("#centerpage").load("OpenSongArtists.jsp",{id:''+artists_id+''});
}
function OpenAllAlbums(){
    $("#centerpage").load("AllAlbums.jsp");
}
function OpenAllArtists(){
    $("#centerpage").load("topartistspage.jsp");
}
function centerpage(){
    $("#centerpage").load("CenterMenupage.jsp");
}
function openplaylistpage(){
    $("#centerpage").load("playlist.jsp");
}
function openalertmsg(){
    alert("Please sign in");
}
function openWindow()
{
     PopupCenter("http://localhost:8080/Mashup/mobilelogin.html", "SMS Login",400,400);
}
function search(){
    var searchcontent=document.getElementById("searchcontent").value;
    $("#centerpage").load("SearchResult.jsp",{searchcontent:''+searchcontent+''});
}
function SignupValidate(){
    var email=document.getElementById("email").value;
    var pass=document.getElementById("pass").value;
    var cpass=document.getElementById("cpass").value;
    if(email===""){
        alert("Enter Email");
        return false;
    }
    if(pass===""){
        alert("Enter Password");
        return false;
    }
    if(cpass===""){
        alert("Conform your Password");
        return false;
    }
    if(pass===cpass){
        document.singupform.submit();
    }else{
        alert("Your Confirmation Password is Wrong");
        document.singupform.cpass.focus();
        return false;
    }
}
function Loginvalidate(){
    var email=document.getElementById("email").value;
    var pass=document.getElementById("pass").value;
    if(email===""){
        alert("Enter Email");
        return false;
    }
    if(pass===""){
        alert("Enter Password");
        return false;
    }
}




function onReady(callback) {
    var intervalId = window.setInterval(function() {
    if (document.getElementsByTagName('body')[0] !== undefined) {
      window.clearInterval(intervalId);
      callback.call(this);
    }
  }, 1000);
}

function setVisible(selector, visible) {
  document.querySelector(selector).style.display = visible ? 'block' : 'none';
}

onReady(function() {
  setVisible('.page', true);
  setVisible('#loading', false);
});
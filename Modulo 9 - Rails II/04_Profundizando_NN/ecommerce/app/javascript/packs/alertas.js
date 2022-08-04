window.addEventListener("load", function(){
    console.log("LOAD normal")    
})

document.addEventListener("turbolinks:load", function() {
    console.log("TURBO LOAD")
})

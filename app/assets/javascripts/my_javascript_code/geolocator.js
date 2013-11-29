
     $(document).ready(function()
     {
        $('#results').click(function() {
          geolocateMe();
        }); // end double click
     }); // end ready

       function geolocateMe() {
         results = document.getElementById("results");
         // If geolocation is available, try to get the visitor's position.
         if (navigator.geolocation) {
           navigator.geolocation.getCurrentPosition(
             geolocationSuccess, geolocationFailure
  );
           results.innerHTML = "Retrieving your current position, please wait a sec..";
           // alert(results.innerHTML)
         }
         else {
           results.innerHTML = "This browser doesn't support geolocation.";
           results.innerHTML
  } };
       function geolocationSuccess(position) {
         results.innerHTML = "You were last spotted at (" +
          position.coords.latitude + " latitude, " + position.coords.longitude + " longitude)";
          // alert(results.innerHTML)

       }
       function geolocationFailure(positionError) {
         results.innerHTML = "Geolocation failed.";
         // alert(results.innerHTML)
  }
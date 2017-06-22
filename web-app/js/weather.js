$(document).ready(function() {
    $("#error-container").addClass('hidden');
    $("#data-container").addClass('hidden');
    $("#btn-weather").click(function(e) {
        e.preventDefault();
        var zip = $("#zipInput").val();
        if (isNaN(zip))
            showErrorZip();
        else
            getWeatherInfo(zip);
    });
});

function getWeatherInfo(zip) {
    console.log("zip " + zip);
    $.getJSON("./weather/getInfo/" + zip, function(data) {
        if (data.success == true) {
            showData(data.responseData);
        } else {
            showError(data.responseData);
        }
    });
}


function showData(responseData) {
    $("#zipInput").val("");
    $("#error-container").addClass('hidden');
    $("#data-container").removeClass('hidden');
    $("#data-container-footer").removeClass('hidden');
    $("#zipCode").html(responseData.zip);
    $("#city").html(responseData.city);
    $("#country").html(responseData.country);
    $("#timestamp").html(responseData.timestamp);
    $("#temperature-body").html(responseData.temp_C + " &deg;C" + " / " + responseData.temp_F + " &deg;F");
    $("#percipitation-body").html(responseData.pressure);
    $("#humidity-body").html(responseData.humidity + "  %");
    $("#windSpeed-body").html(responseData.windSpeed + " km/h");
    $("#weather-timestamp").html(responseData.timestamp);
    $("#weather-desc").html(responseData.weatherDesc);
    $("#weather_icon").html(responseData.icon);
    $("#weather-sunrise").html("Sunrise :"+responseData.sunrise);
    $("#weather-sunset").html("Sunset :"+responseData.sunset);
    $("#weather-visibility").html("Visibility:"+responseData.visibility);
}


function showError(responseData) {
    $("#zipInput").val("");
    $("#data-container").addClass('hidden');
    $("#error-container").removeClass('hidden');
    $("#error-message").html(responseData);
}
function showErrorZip() {
    $("#zipInput").val("");
    $("#data-container").addClass('hidden');
    $("#error-container").removeClass('hidden');
    $("#error-message").html("Please enter a valid zip value");
}
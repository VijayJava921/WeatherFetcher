package com.weather.controllers

import grails.converters.JSON

class WeatherController {

    // inject weather service 
    def weatherService 
	
    def index() { }  	
    def getInfo(){       
        def result = [success : "fail", responseData: null]
        log.info "Request received for weather of zip : "+ params.id?:''        
        if(params.id){
            def data = weatherService.getData(params.id)          
            if(data.success){
                result.success = true
                def date=Date.parse('yyyy-MM-dd', data.resData.data.weather[0].date )    
                def time=data.resData.data.current_condition[0].observation_time
                def weatherData= [
                    temp_C: data.resData.data.current_condition[0].temp_C,
                    temp_F: data.resData.data.current_condition[0].temp_F,
                    pressure: data.resData.data.current_condition[0].pressure,
                    humidity: data.resData.data.current_condition[0].humidity,
                    windSpeed: data.resData.data.current_condition[0].windspeedKmph,
                    zip:params.id,
                    city: data.resData.data.nearest_area[0].areaName[0].value,
                    country: data.resData.data.nearest_area[0].country[0].value,
                    state: data.resData.data.nearest_area[0].region[0].value,                   
                    timestamp:date.format("EEEE")+" "+time,
                    weatherDesc:data.resData.data.current_condition[0].weatherDesc[0].value,
                    icon:data.resData.data.current_condition[0].weatherIconUrl[0].value,
                    sunrise:data.resData.data.weather[0].astronomy[0].sunrise,
                    sunset:data.resData.data.weather[0].astronomy[0].sunset,
                    visibility:data.resData.data.current_condition[0].visibility                                       
                ]
                result.responseData = weatherData
            }else{
                log.error "Failed to get Weather Info for zip: ${params.id}, try after some time"
                result.responseData = "Failed to get Weather Info for zip: ${params.id}, try after some time"
            }
        }
        else{
            log.error "Provide valid zip"
            result.responseData = "Provide valid zip"
        }
        render result as JSON
    }   
}

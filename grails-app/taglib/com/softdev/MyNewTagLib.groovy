package com.softdev
import org.joda.time.*

class MyNewTagLib {
    // static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static defaultEncodeAs = 'text'

    def newDatePicker = { attrs, body ->
		def time = new LocalDateTime()
        def format = grailsApplication.config.datetimepicker.format.datetime
        if(attrs.beanValue == null){
            attrs.beanValue = new LocalDateTime()
        }
        // print attrs.beanValue
        out << 	"""
        		<div class='input-group datetimepicker' data-date-format="${format}" data-default-time="${time}">
        			${g.textField('class': 'form-control', name: attrs.name, value: joda.format(value: attrs.beanValue))}
       				<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
       			</div>
        		"""
	}
}

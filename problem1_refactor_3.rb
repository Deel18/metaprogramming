# Turned Computer class into a Dynamic Proxy.
# If you make a call to Computer#mouse
# it will be routed to method_missingm which check is the wrapped
# data source has a get_mouse_info method.
# If it doesn't have one, the call falls back on the BasicObject#method_missing
# which throws a NoMethodError.
# If the data sourxe knows the component then it will convert the original call
# to two calls, on for DS#get_mouse_info and DS#get_mouse_price.
# The values returned from these calls are then used to build
# the end result.

class Computer < BasicObject
    def initialize(computer_id, data_source)
        @id = computer_id
        @data_source = data_source
    end

    def method_missing(name)
        super if !@data_source.respond_to?("get_#{name}_info")
        info = @data_source.send("get_#{name}_info", @id)
        price = @data_source.send("get_#{name}_price", @id)
        result = "#{name.capitalize}: #{info} ($#{price})"
        return "* #{result}" if price >= 100
        result
    end
end
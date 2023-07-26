import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "Tracking",
    id: "Tracking-2a559328-eef7-4382-8f64-387090232016"
}
service / on new http:Listener(9090) {

    @display {
        label: "Shipping",
        id: "Shipping-5fdaf34d-3586-46d9-9cb8-e1d622e533f2"
    }
    http:Client shippingClient;

    function init() returns error? {
        self.shippingClient = check new ("");
    }

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}

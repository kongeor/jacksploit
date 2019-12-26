package jacksploit;

import com.fasterxml.jackson.databind.ObjectMapper;

import static spark.Spark.*;

public class App {

    private static final ObjectMapper mapper = new ObjectMapper().enableDefaultTyping();

    public static void main(String[] args) {
        post("/echo", "application/json", (req, res) -> {
            String body = req.body();
            return mapper.readValue(body, FooDto.class);
        }, new JsonResponseTransformer());
    }

    public static class FooDto {
        public int id;
        public Object obj;
    }

    public static class BarDto {
        public String msg;
    }
}

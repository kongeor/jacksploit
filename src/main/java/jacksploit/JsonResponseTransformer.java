package jacksploit;

import com.fasterxml.jackson.databind.ObjectMapper;
import spark.ResponseTransformer;

public class JsonResponseTransformer implements ResponseTransformer {

    private ObjectMapper mapper = new ObjectMapper().enableDefaultTyping();

    @Override
    public String render(Object obj) throws Exception {
        return mapper.writeValueAsString(obj);
    }
}

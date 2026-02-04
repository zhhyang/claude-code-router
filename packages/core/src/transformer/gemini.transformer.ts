import {LLMProvider, UnifiedChatRequest} from "../types/llm";
import {Transformer} from "../types/transformer";
import {
    buildRequestBody,
    transformRequestOut,
    transformResponseOut,
} from "../utils/gemini.util";

export class GeminiTransformer implements Transformer {
    name = "gemini";

    endPoint = "/v1/responses";

    async transformRequestIn(
        request: UnifiedChatRequest,
        provider: LLMProvider
    ): Promise<Record<string, any>> {
        return {
            body: {
                model: request.model,
                stream:request.stream,
                ...buildRequestBody(request)
            },
            config: {
                url: provider.baseUrl,
                headers: {
                    Authorization: `Bearer ${provider.apiKey}`,
                },
            },
        };
    }

    transformRequestOut = transformRequestOut;

    async transformResponseOut(response: Response): Promise<Response> {
        return transformResponseOut(response, this.name, this.logger);
    }
}

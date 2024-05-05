import Foundation

public struct Prompt {
    public enum `Type` {
        case chatML
        case alpaca
        case llama
        case mistral
    }

    public let type: `Type`
    public let systemPrompt: String
    public let userMessage: String
    public let history: [Chat]

    public init(type: `Type`,
                systemPrompt: String = "",
                userMessage: String,
                history: [Chat] = []) {
        self.type = type
        self.systemPrompt = systemPrompt
        self.userMessage = userMessage
        self.history = history
    }

    var prompt: String {
        switch type {
        case .llama: encodeLlamaPrompt()
        case .alpaca: encodeAlpacaPrompt()
        case .chatML: encodeChatMLPrompt()
        case .mistral: encodeMistralPrompt()
        }
    }

    private func encodeLlamaPrompt() -> String {
        """
        <s>[INST] <<SYS>>
        \(systemPrompt)
        <</SYS>>
        [
        \(history.map { $0.llamaPrompt }.joined(separator: ",")),
        {
            "role": "user",
            "content": [INST]\(userMessage)[/INST],
        }
        ]
        [/INST]
        """
    }

    private func encodeAlpacaPrompt() -> String {
        """
        Below is an instruction that describes a task.
        Write a response that appropriately completes the request.
        \(userMessage)
        """
    }

    private func encodeChatMLPrompt() -> String {
        """
        \(systemPrompt)
        \(history.map { $0.prompt }.joined(separator: "\n"))
        "user: " \(userMessage)
        """
    }

    private func encodeMistralPrompt() -> String {
        """
        <s>
        \(history.map { $0.mistralPrompt }.joined(separator: "\n"))
        </s>
        [INST] \(userMessage) [/INST]
        """
    }
}
{ pkgs, ... }: {
  programs.pi-coding-agent = {
    enable = true;
    extraPackages = [ pkgs.nodejs_latest ];
    appendSystem = ''
      ## Working Style
      - Understand the task before acting.
      - For non-trivial tasks, briefly explain the plan before making changes.
      - Ask for clarification when an ambiguity could materially change the implementation.
      - Prefer learning from the existing codebase over introducing unnecessary abstractions.
      - Keep explanations concise and focus on the reasoning relevant to the task.
      - When the user provides new information or corrects an assumption, incorporate it immediately.
      - Do not repeat work that has already been completed.
    '';
    context = ''
      ## Environment
      - The operating system is NixOS
      - Check the project's existing development environment before running build or test commands
      - If a required tool is unavailable, check whether the project provides a Nix development shell before attempting to install it

      ## Development
      - Inspect existing code and follow the project's conventions before making changes
      - Prefer minimal, focused changes over unrelated refactoring
      - Run relevant tests when practical and report their actual results
      - Do not claim that a build or test succeeded unless it actually did

      ## Git
      - Never commit, push, or publish changes without explicit permission
      - Do not discard unrelated user changes
    '';
    models.providers.apmix = {
      api = "openai-completions";
      apiKey = "$APMIX_API_KEY";
      baseUrl = "https://api.apmix.ai/v1";
      models = [
        {
          id = "glm-5.3-flash";
          name = "GLM-5.3 Flash";
          contextWindow = 1000000;
          maxTokens = 65536;
        }
        {
          id = "deepseek-v4.1-flash";
          name = "DeepSeek V4.1 Flash";
          contextWindow = 1000000;
          maxTokens = 65536;
        }
        {
          id = "claude-sonnet-5-5";
          name = "Claude Sonnet 5.5";
          contextWindow = 1000000;
          maxTokens = 65536;
        }
        {
          id = "mimo-v2.6-flash";
          name = "MiMo V2.6 Flash";
          contextWindow = 1000000;
          maxTokens = 65536;
        }
      ];
    };
    settings = {
      defaultThinkingLevel = "low";
      packages = [
        "npm:@juicesharp/rpiv-ask-user-question"
        "npm:pi-cache-optimizer"
        "npm:pi-hashline-edit-pro"
        "npm:pi-permission-system"
        "npm:pi-subagents"
        "npm:pi-web-access"
      ];
      subagents = {
        defaultModel = "mimo-v2.6-flash";
        defaultThinking = "medium";
        defaultSubagentContext = "fresh";
        globalConcurrencyLimit = 2;
        maxSubagentDepth = 1;
        parallel = {
          concurrency = 2;
          maxTasks = 4;
        };
      };
    };
  };
  home.file.".pi/agent/pi-permissions.jsonc".text = builtins.toJSON {
    defaultPolicy = {
      bash = "ask";
      mcp = "ask";
      skills = "ask";
      special = "ask";
      tools = "ask";
    };
    bash = {
      "awk *" = "allow";
      "command -v *" = "allow";
      "echo *" = "allow";
      "git branch --list" = "allow";
      "git branch --show-current" = "allow";
      "git diff *" = "allow";
      "git diff" = "allow";
      "git log *" = "allow";
      "git log" = "allow";
      "git status *" = "allow";
      "git status" = "allow";
      "head *" = "allow";
      "ls *" = "allow";
      "pwd" = "allow";
      "sed *" = "allow";
      "stat *" = "allow";
      "tail *" = "allow";
      "wc *" = "allow";
      "which *" = "allow";
    };
    tools = {
      ask_user_question = "allow";
      find = "allow";
      get_search_content = "allow";
      grep = "allow";
      ls = "allow";
      read = "allow";
      source_check = "allow";
      subagents_status = "allow";
      web_search = "allow";
    };
  };
}

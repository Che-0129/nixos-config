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

      ## Subagent Delegation
      - Actively delegate suitable tasks to subagents instead of doing everything yourself.
      - Prefer subagents for codebase exploration, research, independent analysis, and test review.
      - Run independent subagent tasks in parallel when practical.
      - Give each subagent a clear, narrow objective and sufficient context.
      - Avoid duplicating work between yourself and subagents.
      - Handle trivial tasks directly when delegation would add unnecessary overhead.
      - Review subagent findings before using them to make decisions.
      - Keep responsibility for planning, integration, and final verification.
      - Delegate implementation tasks when their scope is well-defined and can be completed independently.
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
    settings = {
      enabledModels = [
        "openai-codex/gpt-*"
        "deepseek/deepseek-v4.1-flash-1017:batch"
        "anthropic/claude-haiku-5.5:batch"
        "nvidia/nemotron-3.5-super-vl:free"
      ];
      defaultThinkingLevel = "low";
      fullscreenCopyOnSelect = false;
      packages = [
        "git:github.com/microsoft/TokenEconomizer"
        "npm:@juicesharp/rpiv-ask-user-question"
        "npm:pi-cache-optimizer"
        "npm:pi-hashline-edit-pro"
        "npm:pi-permission-system"
        "npm:pi-subagents"
        "npm:pi-web-access"
      ];
      subagents = {
        agentOverrides = {
          researcher.advertise = true;
          reviewer.advertise = true;
          scout.advertise = true;
          worker.advertise = true;
        };
        defaultModel = "gpt-6-luna";
        defaultThinking = "off";
        defaultSubagentContext = "fresh";
        globalConcurrencyLimit = 3;
        maxThinking = "high";
        maxSubagentDepth = 1;
        parallel = {
          concurrency = 3;
          maxTasks = 6;
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
      "cd *" = "allow";
      "echo *" = "allow";
      "git branch --list" = "allow";
      "git branch --show-current" = "allow";
      "git diff *" = "allow";
      "git diff" = "allow";
      "git log *" = "allow";
      "git log" = "allow";
      "git show *" = "allow";
      "git show" = "allow";
      "git status *" = "allow";
      "git status" = "allow";
      "head *" = "allow";
      "ls *" = "allow";
      "make" = "allow";
      "nix-shell -p *" = "allow";
      "pwd" = "allow";
      "sed *" = "allow";
      "stat *" = "allow";
      "tail *" = "allow";
      "wc *" = "allow";
      "which *" = "allow";
    };
    tools = {
      ask_user_question = "allow";
      edit = "allow";
      find = "allow";
      get_search_content = "allow";
      grep = "allow";
      insert = "allow";
      ls = "allow";
      outline = "allow";
      read = "allow";
      replace = "allow";
      replace_match = "allow";
      source_check = "allow";
      subagents_enable = "allow";
      subagents_status = "allow";
      web_search = "allow";
    };
  };
}

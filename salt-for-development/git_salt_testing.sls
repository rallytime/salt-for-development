include:
  - salt-for-development

# Clone salt-testing from forked repo, change remote name, and add upstream
salt_testing:
  git.latest:
    - name: https://github.com/rallytime/salt-testing.git
    - target: /home/dev-user/SaltStack/salt-testing
    - remote_name: rallytime
  cmd.run:
    - name: git remote add upstream https://github.com/saltstack/salt-testing
    - cwd: /home/dev-user/SaltStack/salt-testing
    - require:
      - git: salt_testing
    - require_in:
      - cmd: fetch_upstream_salt_testing

# Fetch all tags and branches from upstream salt-testing
fetch_upstream_salt_testing:
  cmd.run:
    - name: git fetch upstream
    - cwd: /home/dev-user/SaltStack/salt-testing

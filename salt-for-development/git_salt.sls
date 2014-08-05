include:
  - salt-for-development

# Clone salt from forked repo, change remote name, and add upstream
rallytime_salt:
  git.latest:
    - name: https://github.com/rallytime/salt.git
    - target: /home/dev-user/SaltStack/salt
    - remote_name: rallytime
  cmd.run:
    - name: git remote add upstream https://github.com/saltstack/salt
    - cwd: /home/dev-user/SaltStack/salt
    - require:
      - git: rallytime_salt
    - require_in:
      - cmd: fetch_upstream_salt
      - cmd: pull_salt_develop

# Fetch all tags a branches from upstream Salt
fetch_upstream_salt:
  cmd.run:
    - name: git fetch upstream
    - cwd: /home/dev-user/SaltStack/salt
    - require_in:
      - cmd: pull_salt_develop
      - cmd: branch_salt_2014.1
      - cmd: branch_salt_2014.7

# Git pull Salt's upstream develop into current develop branch
pull_salt_develop:
  cmd.run:
    - name: git pull upstream develop
    - cwd: /home/dev-user/SaltStack/salt

# Create local 2014.1 branch and pull in upstream
branch_salt_2014.1:
  cmd.run:
    - name: git branch 2014.1 upstream/2014.1
    - cwd: /home/dev-user/SaltStack/salt

# Create local 2014.7 branch and pull in upstream
branch_salt_2014.7:
  cmd.run:
    - name: git branch 2014.7 upstream/2014.7
    - cwd: /home/dev-user/SaltStack/salt

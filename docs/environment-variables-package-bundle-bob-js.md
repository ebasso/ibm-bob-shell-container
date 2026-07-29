# Environment Variables

**166 total**

All `process.env.*` references found in `package/bundle/bob.js`, grouped by category.

## Bob / BobShell

| Variable | Notes |
| --- | --- |
| `BOBSHELL_API_KEY` | API key for BobShell authentication |
| `BOBSHELL_API_KEY_STDIN` | Read API key from stdin |
| `BOBSHELL_DEFAULT_AUTH_TYPE` | Default authentication type |
| `BOBSHELL_HIDE_ENVS` | Hide env vars from output |
| `BOBSHELL_NO_RELAUNCH` | Prevent automatic relaunch |
| `BOBSHELL_PORT` | Port for BobShell server |
| `BOB_SHELL_CLI_IDE_SERVER_PORT` | IDE companion server port |
| `BOB_SHELL_CLI_IDE_SERVER_STDIO_ARGS` | Args for IDE server stdio mode |
| `BOB_SHELL_CLI_IDE_SERVER_STDIO_COMMAND` | Command for IDE server stdio mode |
| `BOB_SHELL_CLI_IDE_WORKSPACE_PATH` | Workspace path for IDE integration |
| `BOB_SHELL_CLI_INTEGRATION_TEST` | Integration test mode flag |
| `BOB_SHELL_CLI_SYSTEM_SETTINGS_PATH` | Path to system settings file |
| `BOB_SHELL_CLI_TEST_VAR` | Test variable (testing only) |
| `BOB_SHELL_CLI_TRUSTED_FOLDERS_PATH` | Path to trusted folders config |
| `BOB_SHELL_CLI_USE_COMPUTE_ADC` | Use compute ADC credentials |
| `BOB_SHELL_DEV_TRACING` | Enable developer tracing |
| `BOB_SHELL_MODEL` | Override default LLM model |
| `BOB_SHELL_PORT` | Bob shell server port |
| `BOB_SHELL_PRE_CHECK_AUTO_APPROVED` | Skip pre-check approval prompt |
| `BOB_SHELL_PROD_BUILD` | Production build flag |
| `BOB_SHELL_SANDBOX` | Sandbox mode selector |
| `BOB_SHELL_SANDBOX_IMAGE` | Docker image for sandbox |
| `BOB_SHELL_SANDBOX_PROXY_COMMAND` | Proxy command inside sandbox |
| `BOB_SHELL_SYSTEM_MD` | Custom system prompt markdown |
| `BOB_WEB_LOGIN_URL` | Web login URL override |
| `ANTIGRAVITY_CLI_ALIAS` | CLI alias for antigravity mode |
| `CLI_TITLE` | Title shown in CLI interface |
| `MANAGE_SUBSCRIPTION_URL` | Subscription management URL |
| `METRICS_FORWARDER_URL` | URL for metrics forwarding |
| `IBM_TELEMETRY_ENABLED` | Enable IBM telemetry |
| `SHOW_DEBUG_LOGS` | Show debug log output |
| `SURFACE` | Surface identifier for UI context |
| `TERM_PRODUCT` | Terminal product identifier |
| `RUN_TIME_HMAC_SECRET` | HMAC secret for runtime security |
| `CURSOR_TRACE_ID` | Trace ID from Cursor IDE |

## Sandbox

| Variable | Notes |
| --- | --- |
| `BUILD_SANDBOX` | Build sandbox flag |
| `SANDBOX` | Sandbox type / profile |
| `SANDBOX_ENV` | Sandbox environment config |
| `SANDBOX_FLAGS` | Extra flags passed to sandbox |
| `SANDBOX_MOUNTS` | Volume mounts for sandbox |
| `SANDBOX_PORTS` | Port mappings for sandbox |
| `SANDBOX_SET_UID_GID` | UID/GID override inside sandbox |
| `SEATBELT_PROFILE` | macOS Seatbelt sandbox profile |

## Google / GCP

| Variable | Notes |
| --- | --- |
| `CODE_ASSIST_ENDPOINT` | Google Code Assist endpoint URL |
| `GCLOUD_PROJECT` | GCP project (legacy) |
| `GOOGLE_API_KEY` | Google API key |
| `GOOGLE_APPLICATION_CREDENTIALS` | Path to service account JSON |
| `GOOGLE_CLOUD_ACCESS_TOKEN` | GCP access token override |
| `GOOGLE_CLOUD_LOCATION` | GCP location/region |
| `GOOGLE_CLOUD_PROJECT` | GCP project ID |
| `GOOGLE_CLOUD_PROJECT_ID` | GCP project ID (alternate) |
| `GOOGLE_CLOUD_QUOTA_PROJECT` | GCP quota project |
| `GOOGLE_CLOUD_REGION` | GCP region |
| `GOOGLE_CLOUD_UNIVERSE_DOMAIN` | GCP universe domain |
| `GOOGLE_GENAI_USE_GCA` | Use Google Code Assist for GenAI |
| `GOOGLE_GENAI_USE_VERTEXAI` | Use Vertex AI for GenAI |
| `GCE_METADATA_HOST` | GCE metadata server host override |
| `GCE_METADATA_IP` | GCE metadata server IP override |
| `DETECT_GCP_RETRIES` | Number of retries for GCP detection |
| `METADATA_SERVER_DETECTION` | GCP metadata server detection mode |
| `OTLP_GOOGLE_CLOUD_PROJECT` | GCP project for OTLP export |
| `GAE_MODULE_NAME` | App Engine module name |
| `GAE_MODULE_VERSION` | App Engine module version |
| `GAE_SERVICE` | App Engine service name |
| `GAE_VERSION` | App Engine version |
| `K_CONFIGURATION` | Cloud Run configuration name |
| `K_REVISION` | Cloud Run revision |
| `K_SERVICE` | Cloud Run service name |
| `CLOUD_RUN_JOB` | Cloud Run job name |
| `CLOUD_SHELL` | Running in Cloud Shell flag |
| `EDITOR_IN_CLOUD_SHELL` | Editor inside Cloud Shell |
| `FUNCTION_NAME` | Cloud Functions name |
| `FUNCTION_REGION` | Cloud Functions region |
| `FUNCTION_TARGET` | Cloud Functions target |

## AWS

| Variable | Notes |
| --- | --- |
| `AWS_ACCESS_KEY_ID` | AWS access key ID |
| `AWS_DEFAULT_REGION` | AWS default region |
| `AWS_REGION` | AWS region |
| `AWS_SECRET_ACCESS_KEY` | AWS secret access key |
| `AWS_SESSION_TOKEN` | AWS session token |

## Authentication / OAuth

| Variable | Notes |
| --- | --- |
| `OAUTH_CALLBACK_HOST` | OAuth callback hostname |
| `OAUTH_CALLBACK_PORT` | OAuth callback port |
| `SSO_PORT` | SSO server port |
| `DEBUG_AUTH` | Enable auth debug logging |
| `GITHUB_TOKEN` | GitHub personal access token |
| `GITHUB_SHA` | GitHub commit SHA (CI) |

## gRPC / OpenTelemetry

| Variable | Notes |
| --- | --- |
| `GRPC_DEFAULT_SSL_ROOTS_FILE_PATH` | Custom CA roots file for gRPC |
| `GRPC_EXPERIMENTAL_ENABLE_OUTLIER_DETECTION` | Enable gRPC outlier detection |
| `GRPC_NODE_TRACE` | gRPC node trace flags |
| `GRPC_NODE_USE_ALTERNATIVE_RESOLVER` | Use alternative DNS resolver |
| `GRPC_NODE_VERBOSITY` | gRPC node log verbosity |
| `GRPC_SSL_CIPHER_SUITES` | TLS cipher suites for gRPC |
| `GRPC_TRACE` | gRPC tracing flags |
| `GRPC_VERBOSITY` | gRPC verbosity level |
| `OTEL_EXPORTER_OTLP_ENDPOINT` | OTLP exporter endpoint |
| `OTEL_EXPORTER_OTLP_HEADERS` | OTLP exporter headers |
| `OTEL_EXPORTER_OTLP_INSECURE` | Disable TLS for OTLP |
| `OTEL_EXPORTER_OTLP_METRICS_PROTOCOL` | OTLP metrics protocol |
| `OTEL_EXPORTER_OTLP_PROTOCOL` | OTLP protocol override |
| `OTEL_EXPORTER_PROMETHEUS_HOST` | Prometheus exporter host |
| `OTEL_EXPORTER_PROMETHEUS_PORT` | Prometheus exporter port |
| `OTEL_SEMCONV_STABILITY_OPT_IN` | OTEL semconv stability opt-in |

## Proxy / Network

| Variable | Notes |
| --- | --- |
| `HTTP_PROXY` | HTTP proxy URL |
| `HTTPS_PROXY` | HTTPS proxy URL |
| `NO_PROXY` | Comma-separated no-proxy hosts |
| `NODE_TLS_REJECT_UNAUTHORIZED` | Disable TLS cert verification (insecure) |
| `CUSTOM_BASE_URL` | Custom base URL for API requests |
| `CUSTOM_TIMEOUT` | Custom request timeout (ms) |

## Node.js / Runtime

| Variable | Notes |
| --- | --- |
| `NODE_DEBUG` | Node.js debug flags |
| `NODE_ENV` | Runtime environment (production/development) |
| `NODE_OPTIONS` | Extra CLI options for Node.js |
| `DEBUG` | debug module namespace filter |
| `DEBUG_MODE` | Generic debug mode flag |
| `DEBUG_PORT` | Node.js debugger port |
| `DEBUG_RAW_LOGS` | Emit raw log output |
| `JEST_WORKER_ID` | Jest parallel worker ID |
| `VITEST` | Running under Vitest flag |
| `DIFF_STRATEGY` | Diff strategy override |
| `DEV` | Dev mode flag |

## Terminal / UI

| Variable | Notes |
| --- | --- |
| `COLORTERM` | Terminal color capability (truecolor, etc.) |
| `FORCE_COLOR` | Force color output |
| `NO_COLOR` | Disable color output (NO_COLOR spec) |
| `TERM` | Terminal type (e.g. xterm-256color) |
| `TERM_PROGRAM` | Terminal program name |
| `TERM_PROGRAM_VERSION` | Terminal program version |
| `BROWSER` | Preferred browser command |
| `EDITOR` | Preferred editor command |
| `VISUAL` | Preferred visual editor command |
| `MONOSPACE_ENV` | Running in monospace/IDE environment |
| `CI` | Running in CI environment |
| `TRAVIS` | Running on Travis CI |
| `CODESPACES` | Running in GitHub Codespaces |
| `REPLIT_USER` | Running on Replit |
| `VSCODE_GIT_ASKPASS_MAIN` | VS Code Git askpass helper |
| `VSCODE_GIT_IPC_HANDLE` | VS Code Git IPC socket path |
| `CONTAINER_NAME` | Container name identifier |
| `HOSTNAME` | System hostname |

## OS / User

| Variable | Notes |
| --- | --- |
| `HOME` | User home directory |
| `HOMEDRIVE` | Windows home drive letter |
| `HOMEPATH` | Windows home directory path |
| `PATH` | Executable search path |
| `PATHEXT` | Windows executable file extensions |
| `APPDATA` | Windows AppData directory |
| `USERPROFILE` | Windows user profile directory |
| `USERNAME` | Windows username |
| `USER` | Unix username |
| `LOGNAME` | Login name |
| `LNAME` | Alternate login name |
| `SHELL` | User shell path |
| `OSTYPE` | OS type string |
| `SSH_CONNECTION` | SSH connection info |
| `SUDO_UID` | UID of the sudo-invoking user |
| `SUDO_GID` | GID of the sudo-invoking user |
| `VIRTUAL_ENV` | Active Python virtual environment path |
| `PYTHONPATH` | Python module search path |
| `WSL_DISTRO_NAME` | WSL distro name |
| `COMSPEC` | Windows command processor path |
| `DESTDIR` | Install destination directory |
| `PREFIX` | Install prefix directory |
| `DEBIAN_FRONTEND` | Debian package manager front-end |

## Git

| Variable | Notes |
| --- | --- |
| `GIT_AUTHOR_EMAIL` | Git author email override |
| `GIT_AUTHOR_NAME` | Git author name override |
| `GIT_COMMITTER_EMAIL` | Git committer email override |
| `GIT_COMMITTER_NAME` | Git committer name override |

## Misc / Internal

| Variable | Notes |
| --- | --- |
| `DOTENV_CONFIG_DEBUG` | dotenv debug mode |
| `DOTENV_CONFIG_QUIET` | dotenv quiet mode |
| `DOTENV_KEY` | dotenv encryption key |
| `RIPGREP_VERSION` | ripgrep version string |
| `TEENY_REQUEST_WARN_CONCURRENT_REQUESTS` | Warn on concurrent HTTP requests |
| `UNDICI_NO_WASM_SIMD` | Disable WASM SIMD in undici |
| `WS_NO_BUFFER_UTIL` | Disable ws buffer-util native addon |
| `WS_NO_UTF_8_VALIDATE` | Disable ws utf-8-validate native addon |
| `YARGS_MIN_NODE_VERSION` | Minimum Node.js version for yargs |
| `GRACEFUL_FS_PLATFORM` | Platform override for graceful-fs |
| `READABLE_STREAM` | readable-stream version preference |
| `TESTING_TAR_FAKE_PLATFORM` | Fake platform for tar testing |
| `TEST_GRACEFUL_FS_GLOBAL_PATCH` | Test global patch for graceful-fs |
| `__CFB` | macOS CoreFoundation bundle (internal) |
| `__COG_BASHRC_SOURCED` | Cog bashrc sourced flag (internal) |
| `__FAKE_FS_O_FILENAME__` | Fake filename for fs testing |
| `__FAKE_PLATFORM__` | Fake platform for testing |
| `__MINIMATCH_TESTING_PLATFORM__` | Platform override for minimatch tests |

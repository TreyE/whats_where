defmodule Mocks.Commands.DestroyEnvironment.NotificationMock do
  use ModuleMocker

  define_mock(
    :broadcast_environment_updates,
    []
  )

  define_mock(
    :broadcast_deployment_updates,
    []
  )
end

option(WITH_HRP5P_RL_TEST
       "Build the HRP5P RL controller test stack: mc_mujoco, the HRP5P MJCF, the external forces observer and the controller"
       OFF
)

if(NOT WITH_HRP5P_RL_TEST)
  return()
endif()

AddProject(
  mc_mujoco
  GITHUB rohanpsingh/mc_mujoco
  GIT_TAG origin/main
  DEPENDS mc_rtc
)

AddProject(
  hrp5p_mj_description
  GITHUB_PRIVATE isri-aist/hrp5p_mj_description
  GIT_TAG origin/main
  DEPENDS mc_mujoco
)

AddProject(
  mc_external_forces_observer
  GITHUB isri-aist/mc_external_forces_observer
  GIT_TAG origin/topic/LPF
  DEPENDS mc_rtc
)

AddProject(
  hrp5p_rl_qp_controller
  GITHUB Dhanushvarma/hrp5p_rl_qp_controller
  GIT_TAG origin/test/scripted-target
  DEPENDS mc_rtc
)

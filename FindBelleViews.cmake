find_package(PkgConfig)

# Let the user specify the include directory manually. Trust but verify.
if(BelleViews_INCLUDE_DIR)

  # consider the directory that they set to be a suggestion!
  set(BelleViews_SUGGESTED_INCLUDE_DIR ${BelleViews_INCLUDE_DIR})
  unset(BelleViews_INCLUDE_DIR)

  # search for the header files.
  find_path(BelleViews_INCLUDE_DIR
    NAMES belleviews.hpp
    PATHS ${BelleViews_SUGGESTED_INCLUDE_DIR}
    DOC "BelleViews library header files"
  )

  # check whether it was found!
  if(NOT BelleViews_INCLUDE_DIR)
    message(FATAL_ERROR "You suggested I look for Belle Views in ${BelleViews_SUGGESTED_INCLUDE_DIR} but I couldn't find it there.\n")
  endif()
endif()

if(NOT EXISTS "${BelleViews_INCLUDE_DIR}")
  set(BelleViews_INCLUDE_DIR "${CMAKE_CURRENT_LIST_DIR}/sources")
endif()

find_package_handle_standard_args(BelleViews "Could not configure BelleViews" BelleViews_INCLUDE_DIR)
mark_as_advanced(BelleViews_INCLUDE_DIR)
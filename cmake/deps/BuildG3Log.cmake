#=======================================================================================
#
#        Filename: BuildG3Log.cmake
#         Created: 05/03/2016 13:19:07
#     Description: required: MIR2X_3RD_PARTY_DIR
#
#         Version: 1.0
#        Revision: none
#        Compiler: cmake
#
#          Author: ANHONG
#           Email: anhonghe@gmail.com
#    Organization: USTC
#
#=======================================================================================

INCLUDE(ExternalProject)

ExternalProject_Add(
    g3log

    GIT_REPOSITORY "https://github.com/KjellKod/g3log"
    GIT_TAG        "master"
  
    SOURCE_DIR "${MIR2X_3RD_PARTY_DIR}/g3log"
    INSTALL_DIR "${MIR2X_3RD_PARTY_DIR}/g3log/build"

    UPDATE_COMMAND ""
    PATCH_COMMAND ""

    CMAKE_ARGS -DCPACK_PACKAGING_INSTALL_PREFIX=${MIR2X_3RD_PARTY_DIR}/g3log/build/install -DCMAKE_BUILD_TYPE=Release -DG3_SHARED_LIB=OFF

    LOG_BUILD 1
    LOG_CONFIGURE 1
    LOG_INSTALL 1
)

SET(G3LOG_INCLUDE_DIRS "${MIR2X_3RD_PARTY_DIR}/g3log/build/install/include")
SET(G3LOG_LIBRARIES    "${CMAKE_STATIC_LIBRARY_PREFIX}g3logger${CMAKE_STATIC_LIBRARY_SUFFIX}")

INCLUDE_DIRECTORIES(SYSTEM ${G3LOG_INCLUDE_DIRS})
LINK_DIRECTORIES(${MIR2X_3RD_PARTY_DIR}/g3log/build/install/lib)

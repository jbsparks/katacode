# Use the PGI Compiler container image from the NVIDIA GPU Cloud
Stage0 += baseimage(image='nvcr.io/hpc/pgi-compilers:ce', _as='build',
                    _distro='ubuntu')

# Parallel NetCDF
Stage0 += pnetcdf()

# MiniWeather
Stage0 += packages(ospackages=['ca-certificates', 'git'])
Stage0 += generic_build(build=['cd /var/tmp/miniWeather/fortran',
                               # Modify code to use the injection dataset
                               'sed -i -e \'s/data_spec_int = DATA_SPEC_THERMAL/data_spec_int = DATA_SPEC_INJECTION/g\' -e \'s/sim_time = 10/sim_time = 1000/g\' miniWeather_mpi_openacc.F90',
                               'mpif90 -I/usr/local/pnetcdf/include -O3 -ta=tesla,pinned,ccall,ptxinfo -Minfo=accel -o miniWeather_mpi_openacc miniWeather_mpi_openacc.F90 -L/usr/local/pnetcdf/lib -lpnetcdf'],
                        commit='66ea33d3e570d2ec795a29b53812e8c0269280a6',
                        install=['install -m 755 -d /opt/miniWeather/bin',
                                 'install -m 755 /var/tmp/miniWeather/fortran/miniWeather_mpi_openacc /opt/miniWeather/bin/miniWeather_mpi_openacc'],
                        repository='https://github.com/mrnorman/miniWeather',
                        prefix='/opt/miniWeather')

###
# Runtime container image
###
Stage1 += baseimage(image='nvidia/cuda:10.0-base-ubuntu16.04')

# PGI compiler (+ MPI library) runtime
Stage1 += pgi(eula=True, mpi=True, version='19.10').runtime(_from='build')

# Runtimes for the other components
Stage1 += Stage0.runtime(_from='build')

# MiniWeather
Stage1 += environment(variables={'PATH': '/opt/miniWeather/bin:$PATH'})

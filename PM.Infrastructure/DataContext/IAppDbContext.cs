﻿using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.SqlServer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PM.Infrastructure.DataContext
{
    public interface IAppDbContext : IDbContext
    {
    }
}
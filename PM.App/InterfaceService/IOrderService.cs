using PM.Application.Payloads.RequestModels.ProjectRequests;
using PM.Application.Payloads.ResponseModels.DataProjects;
using PM.Application.Payloads.Responses;
using PM.Domain;
using System.Collections.Generic;
using System.Threading.Tasks;

public interface IOrderService
{
    Task<ResponseObject<DataResponseOrder>> CreateOrderAsync(Request_CreateOrder request);
    Task<ResponseObject<List<DataResponseOrder>>> GetAllOrdersAsync();
}

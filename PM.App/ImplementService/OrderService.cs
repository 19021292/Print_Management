using Microsoft.AspNetCore.Http;
using PM.Application.Payloads.RequestModels.ProjectRequests;
using PM.Application.Payloads.ResponseModels.DataProjects;
using PM.Application.Payloads.Responses;
using PM.Domain.Entities;
using PM.Domain.InterfaceRepositories;

public class OrderService : IOrderService
{
    private readonly IBaseRepository<Order> _orderRepository;

    public OrderService(IBaseRepository<Order> orderRepository)
    {
        _orderRepository = orderRepository;
    }

    public async Task<ResponseObject<DataResponseOrder>> CreateOrderAsync(Request_CreateOrder request)
    {
        try
        {
            var order = new Order
            {
                ProductID = request.ProductID,
                DesignID = request.DesignID,
                OrderDate = request.OrderDate,
                Status = request.Status,
                DeliveryAddress = request.DeliveryAddress,
                PhoneNumber = request.PhoneNumber,
                CustomerID = request.CustomerID,
                CustomerName = request.CustomerName,
                CreatedAt = DateTime.Now,
                UpdatedAt = null
            };

            var createdOrder = await _orderRepository.CreateAsync(order);

            var response = new DataResponseOrder
            {
                Id = createdOrder.Id,
                ProductID = createdOrder.ProductID,
                DesignID = createdOrder.DesignID,
                OrderDate = createdOrder.OrderDate,
                Status = createdOrder.Status,
                DeliveryAddress = createdOrder.DeliveryAddress,
                PhoneNumber = createdOrder.PhoneNumber,
                CustomerID = createdOrder.CustomerID,
                CustomerName = createdOrder.CustomerName,
                CreatedAt = createdOrder.CreatedAt,
                UpdatedAt = createdOrder.UpdatedAt ?? DateTime.MinValue
            };

            return new ResponseObject<DataResponseOrder>
            {
                Status = StatusCodes.Status201Created,
                Message = "Order created successfully",
                Data = response
            };
        }
        catch (Exception ex)
        {
            // Log the exception for debugging
            Console.WriteLine(ex);

            return new ResponseObject<DataResponseOrder>
            {
                Status = StatusCodes.Status500InternalServerError,
                Message = ex.Message,
                Data = null
            };
        }
    }


    public async Task<ResponseObject<List<DataResponseOrder>>> GetAllOrdersAsync()
    {
        try
        {
            var orders = await _orderRepository.GetAllAsync();

            if (orders == null || !orders.Any())
            {
                return new ResponseObject<List<DataResponseOrder>>
                {
                    Status = StatusCodes.Status404NotFound,
                    Message = "No orders found.",
                    Data = null
                };
            }

            var responseData = orders.Select(o => new DataResponseOrder
            {
                Id = o.Id,
                ProductID = o.ProductID,
                DesignID = o.DesignID,
                OrderDate = o.OrderDate,
                Status = o.Status,
                DeliveryAddress = o.DeliveryAddress,
                PhoneNumber = o.PhoneNumber,
                CustomerID = o.CustomerID,
                CustomerName = o.CustomerName,
                CreatedAt = o.CreatedAt,
                UpdatedAt = o.UpdatedAt ?? DateTime.MinValue
            }).ToList();

            return new ResponseObject<List<DataResponseOrder>>
            {
                Status = StatusCodes.Status200OK,
                Message = "Orders fetched successfully.",
                Data = responseData
            };
        }
        catch (Exception ex)
        {
            return new ResponseObject<List<DataResponseOrder>>
            {
                Status = StatusCodes.Status500InternalServerError,
                Message = ex.Message,
                Data = null
            };
        }
    }
}

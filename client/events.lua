Events = {}

function Events:Create(name, cb)
    if self[name] then return end

    print('Event created: ' .. name)

    self[name] = cb

    RegisterNetEvent(name)

    return AddEventHandler(name, function(...)
        cb(...)
    end)
end

function Events:Trigger(name, ...)
    if not self[name] then
        print('Event not found: ' .. name)
        return
    end

    TriggerEvent(name, ...)
end

function Events:TriggerServer(name, ...)
    if not self[name] then
        print('Event not found: ' .. name)
        return
    end

    TriggerServer(name, ...)
end

function Events:Remove(name)
    if not self[name] then return end

    self[name] = nil

    return RemoveEventHandler(name)
end

-- exports
exports('Create', function(name, cb)
    return Events:Create(name, cb)
end)

exports('Trigger', function(name, ...)
    return Events:Trigger(name, ...)
end)

exports('TriggerServer', function(name, ...)
    return Events:TriggerServer(name, ...)
end)

exports('Remove', function(name)
    return Events:Remove(name)
end)

exports('GetEvents', function()
    return Events
end)